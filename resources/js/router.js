import Vue from 'vue'
import VueRouter from 'vue-router'
import AdminComponent from './components/AdminComponent'
import LoginComponent from './components/LoginComponent'
import RolesComponent from './components/RolesComponent'

const Foo = {template: '<v-alert type="error">Content from foo</v-alert>'}
const Bar = {template: '<v-alert type="error">Content from bar</v-alert>'}
const User = {template: '<v-alert type="info">I am {{ $route.params.name }}</v-alert>'}

Vue.use(VueRouter)
const routes = [
    {
        path: '/foo',
        component: Foo
    },
    {
        path: '/bar',
        component: Bar
    },
    {
        path: '/user/:name',
        component: User
    },
    {
        path: '/',
        redirect: '/login'
    },
    {
        path: '/login',
        name: 'Login',
        component: LoginComponent
    },
    {
        path: '/admin',
        name: 'Admin',
        component: AdminComponent,
        children: [
            {
                path: 'roles',
                name: 'Roles',
                component: RolesComponent,
            }
        ],
        beforeEnter: (to, from, next) => {
            axios.get('/api/verify')
                .then(res => next())
                .catch(e => next('/login'))

             /*if (localStorage.getItem('token')) {
                 next();
             } else {
                 next('/login');
             }*/


        }
    }
]

const router = new VueRouter({routes});
router.beforeEach((to, from, next) => {
    const token = localStorage.getItem('token') || null
    window.axios.defaults.headers['Authorization'] = "Bearer " + token;
    next();
})
export default router
