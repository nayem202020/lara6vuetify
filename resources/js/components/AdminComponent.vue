<template>

    <v-app id="inspire">
        <v-navigation-drawer
            v-model="drawer"
            app
            clipped
        >
            <v-list dense>
                <v-list-item
                    v-for="item in items"
                    :key="item.text"
                    link
                    :to="item.action"
                >
                    <v-list-item-action>
                        <v-icon>{{ item.icon }}</v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>
                            {{ item.text }}
                        </v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
                <v-subheader class="mt-4 grey--text text--darken-1">SUBSCRIPTIONS</v-subheader>
                <v-list>
                    <v-list-item
                        v-for="item in items2"
                        :key="item.text"
                        link
                    >
                        <v-list-item-avatar>
                            <img
                                :src="`https://randomuser.me/api/portraits/men/${item.picture}.jpg`"
                                alt=""
                            >
                        </v-list-item-avatar>
                        <v-list-item-title v-text="item.text"></v-list-item-title>
                    </v-list-item>
                </v-list>
                <v-list-item
                    class="mt-4"
                    link
                >
                    <v-list-item-action>
                        <v-switch v-model="theme" class="ma-4"></v-switch>
                    </v-list-item-action>
                    <v-list-item-title class=" text--darken-1">Switch Theme</v-list-item-title>
                </v-list-item>
                <v-list-item link @click="logout">
                    <v-list-item-action>
                        <v-icon color="grey darken-1">mdi-settings</v-icon>
                    </v-list-item-action>
                    <v-list-item-title class="grey--text text--darken-1">Logout</v-list-item-title>
                </v-list-item>
            </v-list>
        </v-navigation-drawer>

        <v-app-bar
            app
            clipped-left
            color="red"
            dense
        >
            <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
            <v-icon
                class="mx-4"
                large
            >
                mdi-youtube
            </v-icon>
            <v-toolbar-title class="mr-12 align-center">
                <span class="title">Laravel Vuetify Admin Dashboard</span>
            </v-toolbar-title>
            <v-spacer></v-spacer>
            <v-row
                align="center"
                style="max-width: 650px"
            >
                <v-text-field
                    :append-icon-cb="() => {}"
                    placeholder="Search..."
                    single-line
                    append-icon="mdi-magnify"
                    color="white"
                    hide-details
                ></v-text-field>
            </v-row>
        </v-app-bar>

        <v-main>
            <v-container class="">
                <router-view></router-view>
                <v-row
                    justify="center"
                    align="center"
                >

                    <v-col>
                        <v-snackbar
                            v-model="snackbar"
                            :timeout="timeout"
                        >
                            {{ snackbarText }}

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
                    </v-col>
                </v-row>
            </v-container>
        </v-main>
    </v-app>


</template>

<script>
export default {
    name: "adminComponent",
    props: {
        source: String,
    },

    created() {
        this.$vuetify.theme.dark = true
    },
    watch: {
        theme(old,newVal) {
            this.$vuetify.theme.dark = old
        }
    },
    mounted() {
        this.snackbar = localStorage.getItem('logedin') ? true : false;
        localStorage.removeItem('logedin')
    },
    data() {
        return {
            snackbar: false,
            snackbarText: 'You are logged in successfully',
            timeout: 5000,
            theme: true,
            drawer: null,
            items: [
                {icon: 'mdi-trending-up', text: 'Admin', action: '/admin'},
                {icon: 'mdi-youtube-subscription', text: 'Subscriptions'},
                {icon: 'mdi-history', text: 'History'},
                {icon: 'mdi-playlist-play', text: 'Playlists'},
                {icon: 'mdi-clock', text: 'Roles', action: '/admin/roles'},
            ],
            items2: [
                {picture: 28, text: 'Joseph'},
                {picture: 38, text: 'Apple'},
                {picture: 48, text: 'Xbox Ahoy'},
                {picture: 58, text: 'Nokia'},
                {picture: 78, text: 'MKBHD'},
            ],

        }
    },
    computed: {},
    methods: {
        logout() {
            localStorage.removeItem('token')
            localStorage.removeItem('logedin')
            this.$router.push('/')
                .then(res => console.log('Logged out successfully'))
                .catch(error => console.log(error))
        }
    },
    components: {
        // side:sideBar
    }
}
</script>

<style scoped>

</style>
