<template>
    <div>
        <h2>Edit Blog</h2>
        <form  @submit.prevent="updateBlog()">
            <div class="modal-body">

                <div class="form-group">
                    <input type="text" name="title" v-model="form.title"
                           placeholder="Enter Title"
                           class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" name="slug" v-model="form.slug"
                           placeholder="Enter Slug"
                           class="form-control">
                </div>
                <div class="form-group">
                    <label>Blog Content</label>
                    <ckeditor :config="editorConfig"  v-model="form.content"></ckeditor>
                    <has-error :form="form" field="content"></has-error>
                </div>
                <div class="form-group">
                    <label>Blog Image</label>
                    <div>
                        <input type="file" @change="getImage" ref="file" name="file[]" multiple >
                        <button class="btn btn-success" @click.prevent="clearImage">Clear</button>
                    </div>
                    <div v-if="this.UploadImage.length < 1">
                                        <span>
                                            <img :src="Image" alt="" style="height: 80px; height: 80px;margin-top:30px">
                                        </span>
                    </div>
                    <div v-if="this.UploadImage.length > 0">
                                        <span>
                                            <img :src="UploadImage" alt="" style="height: 80px; height: 80px;margin-top:30px">
                                        </span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <router-link :to="{name:'admin-blog'}" type="submit" class="btn btn-secondary"
                             data-dismiss="modal" >Close
                </router-link>
                <button type="submit" class="btn btn-primary">Save change
                </button>
            </div>
        </form>
    </div>
</template>

<script>
    export default {
        name: "EditBlog",
        data() {
            return {
                editMode: false,
                blogs:[],
                Image: [],
                blogData:'',
                UploadImage: [],
                avatar:null,
                filename: null,
                file:'',
                success: '',
                form: new Form({
                    id: '',
                    title:'',
                    slug:'',
                    content:'',
                }),
                // error: null,
                editorConfig: {
                    // The configuration of the editor.
                    filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
                    filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token=',
                    filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
                    filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token=',
                    autoEmbed_widget: 'customEmbed'
                }

            }
        },
        methods:{
            updateBlog() {
                this.isLoading = true;
                const config = {
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    }
                };
                var current = this;
                let image =this.$refs.file.files[0];
                let formData = new FormData();
                this.file = image;
                formData.append('file',image);
                formData.append('slug',current.form.slug);
                formData.append('title',current.form.title);
                formData.append('content',current.form.content);
                console.log(formData);
                axios.post('/api/editBlog/'+this.form.id,formData, config)
                .then(function (response) {
                    console.log(response.data.message);
                    Toast.fire({
                        icon: 'success',
                        title: "S???a thanh cong"
                    });
                    current.$router.push({name: 'admin-blog'});
                })
                .catch(function (error) {
                    this.isLoading = false;
                    console.log(error);
                });
            },

            getImage(e){
                let image =  this.$refs.file.files[0];
                var current = this;
                let reader = new FileReader();
                reader.readAsDataURL(image);
                reader.onload = e => {
                    this.avatar = e.target.result;
                    current.UploadImage.push(current.avatar);

                }
            },
            clearImage(){
                this.avatar = "";
                console.log("aaaaa");
                this.UploadImage = [];
                this.Image = [];
                this.$refs.file.type='text';
                this.$refs.file.type='file';
            },

            getBlogById() {
                let id = this.$route.params.id;
                this.editMode = true;
                axios.get('/api/getBlogById/' +id)
                .then(response => {
                    console.log(response.data[0]);
                    this.blogData = response.data[0];
                    this.form.fill(this.blogData);
                    this.Image = this.blogData.image;
                });
            },
        },
        created() {
            this.getBlogById();
        }

    }
</script>

<style scoped>

</style>
