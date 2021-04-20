<template>
    <v-app id="inspire">
        <v-data-table

            :headers="headers"
            :items="roles.data"
            :items-per-page="perPage"
            
            @pagination="paginate"
            :server-items-length="roles.total"
            :loading="loading"
            loading-text="Please wait----------------Loading"
            sort-by="calories"
            class="elevation-1"
            :footer-props="{
            itemsPerPageOptions:[2,3,5,10],
            itemsPerPageText:'Roles per page',
            'show-current-page':true,
            'show-first-last-page':true,
        }"
            :search="search"
            show-select
            @input="selectAll"
        >

            <template v-slot:top>
                <v-toolbar
                    flat
                >
                    <v-toolbar-title>Role Management Syestem</v-toolbar-title>
                    <v-divider
                        class="mx-4"
                        inset
                        vertical
                    ></v-divider>
                    <v-text-field
                        @input="searchData"
                        append-icon="mdi-magnify"
                        label="Search"
                        single-line
                        hide-details
                    ></v-text-field>
                    <v-spacer></v-spacer>
                    <v-dialog
                        v-model="dialog"
                        max-width="500px"
                    >
                        <template v-slot:activator="{ on, attrs }">

                            <v-btn
                                color="primary"
                                dark
                                class="mb-2"
                                v-bind="attrs"
                                v-on="on"
                            >
                                Add New Role
                            </v-btn>
                            <v-btn
                                color="error"
                                dark
                                class="mb-2 mr-2"
                                @click="deleteAll"
                            >
                                Delete
                            </v-btn>
                        </template>
                        <v-card>
                            <v-card-title>
                                <span class="headline">{{ formTitle }}</span>
                            </v-card-title>

                            <v-card-text>
                                <v-container>
                                    <v-row>
                                        <v-col
                                            cols="12"
                                            sm="12"
                                        >
                                            <v-text-field
                                                v-model="editedItem.name"
                                                label="Role name"
                                                color="error"
                                            ></v-text-field>
                                        </v-col>
                                       
                                    </v-row>
                                </v-container>
                            </v-card-text>

                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn
                                    color="blue darken-1"
                                    text
                                    @click="close"
                                >
                                    Cancel
                                </v-btn>
                                <v-btn
                                    color="blue darken-1"
                                    text
                                    @click="save"
                                >
                                    Save
                                </v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    <v-dialog v-model="dialogDelete" max-width="500px">
                        <v-card>
                            <v-card-title class="headline">Are you sure you want to delete this item?</v-card-title>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="blue darken-1" text @click="closeDelete">Cancel</v-btn>
                                <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
                                <v-spacer></v-spacer>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                </v-toolbar>
            </template>

            <template v-slot:item.actions="{ item }">
                <v-icon
                    small
                    class="mr-2"
                    @click="editItem(item)"
                >
                    mdi-pencil
                </v-icon>
                <v-icon
                    small
                    @click="deleteItem(item)"
                >
                    mdi-delete
                </v-icon>
            </template>
            <template v-slot:no-data>
                <v-btn
                    color="primary"
                    @click="initialize"
                >
                    Reset
                </v-btn>
            </template>

        </v-data-table>
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
    </v-app>
</template>
<script>
export default {
    name: "RolesComponent",
    props: {
        source: String,
    },

    data() {
        return {
            perPage: 5,
            currentPage:1,
            selected: [],
            search: '',
            loading: false,
            snackbar: false,
            snackbarText: '',
            timeout: 3000,

            dialog: false,
            dialogDelete: false,
            headers: [
                {text: '#', value: 'id', align: 'start'},
                {text: 'Name', value: 'name'},
                {text: 'Created at', value: 'created_at'},
                {text: 'Updated at', value: 'updated_at'},
                {text: 'Actions', value: 'actions', sortable: false},
            ],
            roles: [],
            editedIndex: -1,
            deletedId: '',
            editedItem: {
                id: '',
                name: '',
                created_at: '',
                updated_at: '',
            },
            defaultItem: {
                id: '',
                name: '',
                created_at: '',
                updated_at: '',

            },
        }
    },

    computed: {
        formTitle() {
            return this.editedIndex === -1 ? 'New Role' : 'Edit Role'
        }
    },

    watch: {
        dialog(val) {
            val || this.close()
        },
        dialogDelete(val) {
            val || this.closeDelete()
        },
    },

    created() {
        this.perPage = +(this.$route.query.per_page||5);
        this.currentPage = +(this.$route.query.page||1);
        
        this.initialize();
    },

    methods: {
        selectAll(e) {
            this.selected = [];
            if (e.length > 0) {
                this.selected = e.map(val => val.id)
            }
        },
        deleteAll() {
            if (this.selected.length > 0) {
                const decide = confirm('Are you sure want to delete selected items');
                if (decide) {
                    axios.post('/api/role-delete', {'roles': this.selected})
                        .then(res => {
                            this.selected.map(val => {
                                const index = this.roles.data.indexOf(val)
                                this.roles.data.splice(index, 1)
                            })
                            this.snackbarText = "Roles Deleted successfully"
                            this.snackbar = true;
                        })
                        .catch(e => console.dir(e.response))
                }
            }else {
                alert("Please select item")
            }
        },
        searchData(e) {
            if (e.length > 0 && e != " " && e != "  ") {
                axios.get(`/api/search-data/${e}`)
                    .then(res => {
                        this.roles = res.data.queryData
                    })
                    .catch(error => console.dir(error.response))
            }
            if (e.length <= 0) {
                axios.post(`/api/roles`)
                    .then(res => {
                        this.roles = res.data.queryData
                    })
                    .catch(error => console.dir(error.response))
            }
        },
        paginate(e) {
             console.log(e); 
            axios.get(`/api/roles?page=${e.page}`, {params: {'per_page': e.itemsPerPage}})
                .then(res => {
                    this.roles = res.data?.queryData?res.data?.queryData:[];
                
                    console.log(this.$route.queryData); 
                    console.log(this.$route.query); 
                    console.log(this.$route.page); 
                    console.log(this.$route.currentPage); 
                    console.log(this.$route.per_page); 
                    console.log(this.$route); 
                    const query = { ...this.$route.query, page: e.page ,per_page: e.itemsPerPage};
                    this.$router.replace({ query });
                    console.log(this.$route.queryData); 
                    console.log(this.$route.query); 
                    console.log(this.$route.page); 
                    console.log(this.$route.currentPage); 
                    console.log(this.$route.per_page); 
                    console.log(this.$route);


                })
                .catch(error => {
                    if (error.response.status == 401) {
                        localStorage.removeItem('token');
                        this.$router.push('/login')
                    }
                })
        },
        initialize() {
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

        },

        editItem(item) {
            this.editedIndex = this.roles.data.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialog = true
        },

        deleteItem(item) {
            this.deletedId = item.id
            this.editedIndex = this.roles.data.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialogDelete = true
        },

        deleteItemConfirm() {
            axios.get('/api/role-delete/' + this.deletedId)
                .then(res => {
                    this.roles.data.splice(this.editedIndex, 1)
                    this.snackbarText = "Role Deleted successfully"
                    this.snackbar = true;
                    this.closeDelete()
                })
                .catch(e => console.dir(e.response))

        },

        close() {
            this.dialog = false
            this.$nextTick(() => {
                this.editedItem = Object.assign({}, this.defaultItem)
                this.editedIndex = -1
            })
        },

        closeDelete() {
            this.deletedId = ''
            this.dialogDelete = false
            this.$nextTick(() => {
                this.editedItem = Object.assign({}, this.defaultItem)
                this.editedIndex = -1
            })

        },

        save() {
            if (this.editedIndex > -1) {
                const index = this.editedIndex;
                axios.post('/api/role-update/' + this.editedItem.id, {'name': this.editedItem.name})
                    .then(res => {
                        Object.assign(this.roles.data[index], res.data.role)
                        this.snackbarText = "Role Edited successfully"
                        this.snackbar = true;
                    })
                    .catch(e => {
                        console.dir(e.response)
                        this.snackbarText = "Role Error in editing"
                        this.snackbar = true;
                    })

            } else {
                axios.post('/api/role-save', {'name': this.editedItem.name})
                    .then(res => {
                        this.roles.data.push(res.data.role)
                        this.snackbarText = "Role Saved successfully"
                        this.snackbar = true;
                    })
                    .catch(e => {
                        console.dir(e.response)
                        this.snackbarText = "Role Error in adding"
                        this.snackbar = true;
                    })
            }
            this.close()
        },
    },
}
</script>

<style scoped>

</style>
