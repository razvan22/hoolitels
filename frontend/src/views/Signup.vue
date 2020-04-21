<template>
<body>
    <Header/>

   <UserInformationForm/>

    <Footer/>
</body>
</template>

<script>
import UserInformationForm from '../components/UserInformationForm.vue'
import Footer from '../components/Footer.vue'
import Header from '../components/Header.vue'
export default {
    components:{
        Footer,
        Header,
        UserInformationForm
    }

}
</script>

<style>

</style>