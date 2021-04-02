<template>
  <v-layout column justify-center align-center>
    <loading-view v-show="loading" />
      <div v-show="!loading">
      <div class="card-wrapper">
        <risyu-card :name="courseName" :imageSrc="src" v-on:load="load"></risyu-card>
      </div>
      <div class="card-wrapper-sp">
        <risyu-card :name="courseName" :imageSrc="src" v-on:load="load"></risyu-card>
      </div>
      <div class="d-flex justify-center">
      <v-btn class="back-button" outlined height="64" color="#2ca14f" @click="toTop()">
        <div class="back-text">トップページへもどる</div>
      </v-btn>
      </div>
      </div>
  </v-layout>
</template>

<style scoped lang="scss">
@import "@/assets/scss/_imports.scss";

.card-wrapper {
  display: flex;
  justify-content: between;
  @include mq-down() {
    display: none;
  }
}

.card-wrapper-sp {
  @include mq-up() {
    display: none;
  }
}

.back-button{
  margin: 24px;
  @include mq-down() {
    font-size: 20px;
    letter-spacing: 0.02em;
  }
}

.back-text{
  font-size: 28px;
  font-weight: 700;
  letter-spacing: 0.1em;
  @include mq-down() {
    font-size: 20px;
    letter-spacing: 0.02em;
  }
}
</style>

<script lang="ts">
import { Vue, Component } from "vue-property-decorator";
import "vue-router";

@Component({})
export default class DefaultLayout extends Vue {
  loading: boolean = false;
  visible: boolean = false;

  courseName: string = "経済学部"
  src: string = "keizai.png"

  toTop() {
    this.$router.push("/");
  }

  handleScroll() {
    if (!this.visible) {
      var top = this.$el.getBoundingClientRect().top;
      this.visible = top < window.innerHeight + 300;
    }
  }

  load() {
    setTimeout(() => {
      this.loading = false;
    }, 1000);
  }
}
</script>