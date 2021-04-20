<template>
    <v-app id="inspire">
        <v-app id="inspire">
            <v-main>
                <v-container class="fill-height" fluid>
                    <v-row align="center" justify="center">
                        <v-col cols="12" sm="8" md="4">
                            <v-card class="elevation-12">

                                <v-toolbar color="error" dark flat>
                                    <v-toolbar-title>Login menu</v-toolbar-title>
                                    <v-spacer></v-spacer>
                                </v-toolbar>
                                <v-card-text>
                                    <v-progress-linear
                                        :active="loading"
                                        :indeterminate="loading"
                                        absolute
                                        top
                                        color="deep-purple accent-4"
                                    ></v-progress-linear>
                                    <v-form
                                        ref="form"
                                        v-model="valid"
                                        :lazy-validation=false
                                    >
                                        <v-text-field
                                            label="Login"
                                            name="login"
                                            v-model="email"
                                            :rules="emailRules"
                                            required
                                            prepend-icon="mdi-account"
                                            type="text">

                                        </v-text-field>

                                        <v-text-field
                                            id="password"
                                            label="Password"
                                            name="password"
                                            v-model="password"
                                            :rules="passwordRules"
                                            required
                                            prepend-icon="mdi-lock"
                                            type="password">

                                        </v-text-field>
                                    </v-form>
                                    <v-snackbar
                                        v-model="snackbar"
                                        :timeout="timeout"
                                    >
                                        {{ text }}

                                        <template v-slot:action="{ attrs }">
                                            <v-btn
                                                color="blue"
                                                text
                                                v-bind="attrs"
                                                @click="snackbar = false"
                                            >
                                                Close
                                            </v-btn>
                                        </template>
                                    </v-snackbar>
                                </v-card-text>
                                <v-card-actions>
                                    <v-spacer></v-spacer>
                                    <v-btn color="error" :disabled="!valid" @click="login">Login</v-btn>
                                </v-card-actions>
                            </v-card>
                        </v-col>
                    </v-row>
                </v-container>
            </v-main>
        </v-app>
    </v-app>
</template>

<script>
export default {
    name: "loginComponent",
    props: {
        source: String,
    },
    mounted() {
    },
    data() {
        return {
            email: '',
            emailRules: [
                v => !!v || 'E-mail is required',
                v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
            ],
            password: '',
            passwordRules: [
                v => !!v || 'Password is required',
            ],
            loading: false,
            snackbar: false,
            text: '',
            timeout: 5000,
            valid: true,
        }
    },
    computed: {},
    methods: {
        login() {
            axios.interceptors.request.use((config) => {
                this.loading = true;
                return config;
            }, (error) => {
                this.loading = false;
                return Promise.reject(error);
            });
            axios.interceptors.response.use((response) => {
                this.loading = false;
                return response;
            }, (error) => {
                this.loading = false;
                return Promise.reject(error);
            });
            axios.post('/api/login', {'email': this.email, 'password': this.password})
                .then(res => {
                    //console.dir(res);
                    localStorage.setItem('token', res.data.token)
                    localStorage.setItem('logedin', true)
                    if (res.data.isAdmin) {
                        this.$router.push('/admin')
                            .then(res => console.log('Logged in successfully'))
                            .catch(error => console.log(error))
                    }else {
                        this.text = "You need to logged in as admin"
                        this.snackbar = true
                    }
                })
                .catch(error => {
                    this.text = error.response.data.status
                    this.snackbar = true
                    console.dir(error.response.data);
                })
        }
    },
    components: {
        // side:sideBar
    }
}
</script>

<style scoped>

</style>
