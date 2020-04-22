<template>
  <footer class="footer">
    <ul class="row center-align">
      <div class="col l12 m12 s12">
        <span class="fab fa-facebook fa-2x"></span>
        <span class="fab fa-instagram fa-2x"></span>
        <span class="fab fa-twitter fa-2x"></span>
      <div>
        <span id="footer-text">@Copyright Hoolitels {{ currentYear }}</span>
      </div>
      </div>
    </ul>
  </footer>
</template>

<script>
  export default {
    name: 'Footer',
    data() {
      return {
        currentYear: new Date().getFullYear(),
      }
    },
  }
</script>

<style scoped> 

  .footer ul {
    background: rgba(255, 255, 255, 0.5);
    padding-top: 5px;
    bottom: 0;
    width: 100%;
  }
  .footer span {
    padding-left: 8%;
    padding-right: 8%;
  }
  .footer .fa-facebook {
    color: rgb(102, 102, 105);
  }
  .footer .fa-instagram {
    color: purple;
  }

  .footer .fa-twitter {
    color: lightblue;
  }
</style>
