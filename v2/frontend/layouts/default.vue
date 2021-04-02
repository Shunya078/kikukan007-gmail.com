<template>
  <v-app>
    <div class="app-bar-wrapper">
    <v-app-bar :clipped-left="clipped" fixed app flat height="96" color="#00C853">
      <v-toolbar-title v-text="title" class="title-text" @click="toTop()" />
      <v-spacer />
    </v-app-bar>
    </div>
    <div class="app-bar-wrapper-sp">
    <v-app-bar :clipped-left="clipped" fixed app flat height="64" color="#00C853">
      <v-toolbar-title v-text="titleSp" class="title-text" @click="toTop()" />
      <v-spacer />
      <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>
    </v-app-bar>
    </div>
    <v-main>
      <v-container class="main-container">
        <nuxt />
      </v-container>
    </v-main>
    <v-navigation-drawer
      v-model="drawer"
      right
      temporary
      fixed
      disable-route-watcher
    >
      <v-list @click.native="drawer = !drawer" nav dense>
        <v-list-item class="f-flex justify-center">
            <div class="menu-text">名大男子ラクロス部</div>
        </v-list-item>
        <v-list-item to="/" class="f-flex justify-center top-box">
          <div><v-icon
                color="#424242"
                class="icon-wrapper"
                >mdi-file-find</v-icon
              >トップページ</div>
        </v-list-item>
        <v-list-item :href="blogUrl"
            target="_blank" class="f-flex justify-center">
            <div><v-icon
                color="#424242"
                class="icon-wrapper"
                >mdi-blogger</v-icon
              >公式ブログ</div>
        </v-list-item>
        <div class="d-flex justify-center come-text">各種SNSはこちら</div>
        <v-list-item class="f-flex justify-center">
          <v-btn
            icon
            :href="lineUrl"
            target="_blank"
            width="72"
            x-large
            :ripple="false"
          >
              <v-icon
                color="#06c755"
                >mdi-alpha-l-box</v-icon
              >
          </v-btn>
          <v-btn
            icon
            :href="twitterUrl"
            target="_blank"
            width="72"
            x-large
            :ripple="false"
          >
              <v-icon
                color="#00aced"
                >mdi-twitter</v-icon
              >
          </v-btn>
          <v-btn
            icon
            :href="instagramUrl"
            target="_blank"
            width="72"
            x-large
            :ripple="false"
          >
              <v-icon
                color="#CF2E92"
                >mdi-instagram</v-icon
              >
          </v-btn>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-footer
      class="d-flex justify-center"
      :absolute="!fixed"
      app
      color="accent"
      height="144"
    >
    <div class="d-flex flex-column">
      <span class="d-flex footer-text justify-center">各種SNSはこちらまで</span>
      <div class="d-flex flex-row justify-center">
          <v-btn
            icon
            :href="lineUrl"
            target="_blank"
            width="72"
            x-large
            :ripple="false"
          >
              <v-icon
                color="#06c755"
                >mdi-alpha-l-box</v-icon
              >
          </v-btn>
          <v-btn
            icon
            :href="twitterUrl"
            target="_blank"
            width="72"
            x-large
            :ripple="false"
          >
              <v-icon
                color="#00aced"
                >mdi-twitter</v-icon
              >
          </v-btn>
          <v-btn
            icon
            :href="instagramUrl"
            target="_blank"
            width="72"
            x-large
            :ripple="false"
          >
              <v-icon
                color="#CF2E92"
                >mdi-instagram</v-icon
              >
          </v-btn>
        </div>
        <span class="footer-text"
          >&copy; {{ new Date().getFullYear() }}. All rights reserved. Mady by Shunya.</span
        >
      </div>
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

.app-bar-wrapper{
  @include mq-down() {
    display: none;
  }
}

.app-bar-wrapper-sp {
  @include mq-up() {
    display: none;
  }
}

.top-box{
  margin-top: 20px;
}

.come-text{
  margin: 12px;
  padding-top: 36px;
  font-size: 20px;
  font-weight: 700;
}

.menu-text{
  margin: 12px;
  font-size: 20px;
  font-weight: 700;
}

.icon-wrapper{
  padding: 0 12px;
}

.main-container{
  width: 100%;
  @include mq-up() {
    padding-top: 48px;
  }
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
  titleSp: string =  "履修登録案内"

  blogUrl: string = "https://nu-mlax.com/"
  lineUrl: string = "https://lin.ee/ATMr0IN"
  twitterUrl: string = "https://twitter.com/nul_21shinkan"
  instagramUrl: string= "https://www.instagram.com/nul_21shinkan/"

  toTop() {
    this.$router.push("/");
  }
}
</script>