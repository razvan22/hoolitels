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
  name: "Footer",
  data() {
    return {
      currentYear: new Date().getFullYear()
    };
  }
};
</script>

<style scoped>
.footer {
  position: sticky;  
  width: 100%;
  bottom: 0;
  overflow: hidden;
}

.footer ul {
  background: rgba(255, 255, 255, 0.5);
  padding-top: 5px;
  width: 100%;
}

.footer .row {
  margin-bottom: 0px !important;
  margin-top: 0px !important;
}


.footer span {
  padding-left: 8%;
  padding-right: 8%;
}
.footer .fa-facebook {
  color: rgb(66, 103, 178);
}
.footer .fa-instagram {
  color: purple;
}

.footer .fa-twitter {
  color: lightblue;
}
</style>
