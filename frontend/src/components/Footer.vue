<template>
  <div class="container s12 center-align">
    <ul class="Footer">
      <span class="fab fa-facebook fa-3x"></span>
      <span class="fab fa-instagram fa-3x"></span>
      <span class="fab fa-twitter-square fa-3x"></span>
      <div>
        <span id="footer-text">@Copyright Hoolitels {{ currentYear }}</span>
      </div>
    </ul>
  </div>
</template>

<script>
export default {
  name: "Footer",
  data() {
    return {
      currentYear: new Date().getFullYear(),
    };
  },
};
</script>

<style>
.Footer {
  margin-top: 3em;
  position: relative;
}
.Footer ul {
  box-sizing: border-box;
  border: 1px solid black;
  bottom: 0;
  position: absolute;
  width: 100%;
}
.Footer span {
  padding: 10px;
}
.Footer .fa-facebook {
  color: rgb(102, 102, 105);
}
.Footer .fa-instagram {
  color: purple;
}

.Footer .fa-twitter-square {
  color: lightblue;
}
</style>
