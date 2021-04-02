<template>
  <v-layout column justify-center align-center>
    <loading-view v-show="loading" />
    <div v-show="!loading">
      <div class="card-wrapper">
        <risyu-card
          :name="courseName"
          :imageSrc="src"
          v-on:load="load"
        ></risyu-card>
      </div>
      <div class="card-wrapper-sp">
        <risyu-card
          :name="courseName"
          :imageSrc="src"
          v-on:load="load"
        ></risyu-card>
      </div>
      <div class="d-flex justify-center">
        <v-btn
          class="back-button"
          outlined
          height="64"
          color="#2ca14f"
          @click="toTop()"
        >
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

.back-button {
  margin: 24px;
  @include mq-down() {
    font-size: 20px;
    letter-spacing: 0.02em;
  }
}

.back-text {
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

  get src(): string {
    if (this.$route.params.id == "1") {
      return "i.png";
    } else if (this.$route.params.id == "2") {
      return "kango.png";
    } else if (this.$route.params.id == "3") {
      return "housya.png";
    } else if (this.$route.params.id == "4") {
      return "kensa.png";
    } else if (this.$route.params.id == "5") {
      return "rigaku.png";
    } else if (this.$route.params.id == "6") {
      return "sagyo.png";
    }
    return "アップデートです。";
  }

  get courseName(): string {
    if (this.$route.params.id == "1") {
      return "医学科";
    } else if (this.$route.params.id == "2") {
      return "看護学専攻";
    } else if (this.$route.params.id == "3") {
      return "放射線技術科学専攻";
    } else if (this.$route.params.id == "4") {
      return "検査技術科学専攻";
    } else if (this.$route.params.id == "5") {
      return "理学療法学専攻";
    } else if (this.$route.params.id == "6") {
      return "作業療法学専攻";
    }
    return "";
  }
}
</script>
