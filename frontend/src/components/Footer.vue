<template>
  <footer class="footer">
    <ul class="container s12 center-align">
      <span class="fab fa-facebook fa-2x"></span>
      <span class="fab fa-instagram fa-2x"></span>
      <span class="fab fa-twitter fa-2x"></span>
      <div>
        <span id="footer-text">@Copyright Hoolitels {{ currentYear }}</span>
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

<style>
  .footer {
    /* margin-top: 1em; */
  }
  .footer ul {
    background: rgba(255, 255, 255, 0.5);
    box-sizing: border-box;
    padding-top: 5px;
    /* border: 1px solid black; */
    bottom: 0;
    position: fixed;
    width: 100%;
  }
  .footer span {
    padding-left: 20px;
    padding-right: 20px;
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
