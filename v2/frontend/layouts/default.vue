<template>
  <v-app>
    <v-app-bar :clipped-left="clipped" fixed app flat height="96" color="white">
      <v-toolbar-title v-text="title" class="title-text" @click="toTop()" />
      <v-spacer />
    </v-app-bar>
    <v-main>
      <v-container>
        <nuxt />
      </v-container>
    </v-main>
    <v-footer
      class="d-flex justify-center"
      :absolute="!fixed"
      app
      color="accent"
      height="72"
    >
      <span class="footer-text"
        >&copy; {{ new Date().getFullYear() }}. All rights reserved. Mady by Shunya078.</span
      >
    </v-footer>
  </v-app>
</template>

<style scoped lang="scss">
@import "@/assets/scss/_imports.scss";

.title-text {
  font-size: 28px;
  font-weight: 700;
  letter-spacing: 0.1em;
  padding-left: 24px;
  @include mq-down() {
    font-size: 20px;
    letter-spacing: 0.02em;
  }
}
.footer-text {
  font-size: 16px;
  color: $gray;
}
</style>

<script lang="ts">
import { Vue, Component } from 'vue-property-decorator'
import "vue-router";

@Component({})
export default class DefaultLayout extends Vue {
  clipped: boolean = false
  drawer: boolean = false
  fixed: boolean = false
  miniVariant: boolean = false
  title: string =  "名大男子ラクロス部：履修登録案内"

  toTop() {
    this.$router.push("/");
  }
}
</script>