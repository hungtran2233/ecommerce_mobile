<template>
    <div>
        <!-- Breadcrumb Section Begin -->
        <div class="breacrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <a href="#"><i class="fa fa-home"></i> Trang Chủ</a>
                            <span>Đăng Nhập</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Form Section Begin -->

        <!-- Register Section Begin -->
        <div class="register-login-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3">
                        <div class="login-form">
                            <h2>Đăng Nhập</h2>
                            <form @submit.prevent="login">
                                <div class="group-input">
                                    <label for="username">Tài khoản hoặc e-mail</label>
                                    <input type="email" id="username" name="email" v-model="form.email" :class="{ 'is-invalid': form.errors.has('email') }">
                                    <has-error :form="form" field="email"></has-error>
                                </div>
                                <div class="group-input">
                                    <label for="pass">Mật khẩu</label>
                                    <input type="password" id="pass" name="password" v-model="form.password" :class="{ 'is-invalid': form.errors.has('password') }">
                                    <has-error :form="form" field="password"></has-error>
                                </div>
                                <div class="group-input gi-check">
                                    <div class="gi-more">
                                        <label for="save-pass">
                                            Nhớ mật khẩu &emsp;
                                            <input type="checkbox" id="save-pass">
                                            <span class="checkmark"></span>
                                        </label>
                                        <router-link to="/email">Quên mật khẩu ?</router-link>
                                    </div>
                                </div>
                                <button type="submit" class="site-btn login-btn">Đăng Nhập</button>
                            </form>
                            <div class="switch-login">
                                <router-link :to="{name : 'register'}" class="or-login">Tạo tài khoản mới</router-link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Register Form Section End -->

        <!-- Partner Logo Section Begin -->
        <div class="partner-logo">
            <div class="container">
                <div class="logo-carousel owl-carousel">
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-1.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-2.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-3.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-4.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-5.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Partner Logo Section End -->
    </div>
</template>

<script>
    export default {
        name: "Login",
        data() {
            return {
                form: new Form({
                    email:'',
                    password:'',
                }),
            }
        },
        methods: {
            login() {
                var current = this;
                this.form.post('/api/login', this.form)
                .then(response => {
                    console.log(response.data.data);
                    let auth = response.data.data;
                    if (!auth || auth.length === 0) {
                            Toast.fire({
                            icon: 'error',
                            title: "Dang nhap that bai"
                        });
                    }else{
                        this.$store.commit('login', auth);
                        Toast.fire({
                        icon: 'success',
                        title: response.data.message
                     });
                     current.$router.push({path: '/home'});
                    }
                    $('#exampleModal').modal('hide');
                    Fire.$emit('afterSaveChange');
                })
                .catch(function (error) {
                    console.log(error);
                })
            },
        },

        created() {
            //this.login();
        }
    }
</script>

<style scoped>

</style>
