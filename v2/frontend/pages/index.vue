<template>
  <v-layout column justify-center align-center>
    <v-flex xs12 sm8 md6>
    <loading-view v-show="loading" />
    <div v-show="!loading">
      <v-layout wrap>
        <figure class="relative">
        <img
          src="~/assets/images/lizardsimg3.jpg"
          class="headerImage"
          v-on:load="load"
        />
        <img
          src="~/assets/images/lizardsimg4.jpg"
          class="headerImage-sp"
          v-on:load="load"
          />
          <figcaption class="absolute-text">
            <p class="jpn-text">履修登録確認表</p>
            <br />
            <p class="eng-text">Course Registration</p>
          </figcaption>
        </figure>
      </v-layout>
    </div>
    </v-flex>
  </v-layout>
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

.headerImage {
  width: 100%;
  height: auto;
  opacity: 0.6;
  @include mq-down() {
    display: none;
  }
}

.headerImage-sp {
  width: 100%;
  height: auto;
  opacity: 0.6;
  @include mq-up() {
    display: none;
  }
  @include mq-down() {
    display: relative;
  }
}

.relative {
  position: relative;
}
.absolute-text {
  position: absolute;
  right: 0;
  bottom: 75px;
  color: #fff;
  background: rgba(0, 0, 0, 0.4);
  width: 50%;
  padding: 2em 1em 1em 0;
  line-height: 24px;
  @include mq-down() {
    bottom: 15px;
    width: 100%;
    line-height: 20px;
    padding: 2em 0 0.5em 0;
  }
}
.jpn-text {
  margin: 0;
  padding: 0 0.8em;
  font-size: 28px;
  font-weight: 700;
  letter-spacing: 0.25em;
  text-align: right;
  @include mq-down() {
    font-size: 24px;
  }
}
.eng-text {
  margin: 0;
  padding: 0 2em;
  font-size: 16px;
  font-weight: 700;
  letter-spacing: 0.5em;
  text-align: right;
}

</style>

<script lang="ts">
import { Vue, Component } from "vue-property-decorator";
import "vue-router";

@Component({})
export default class DefaultLayout extends Vue {
  title: string = "名大男子ラクロス部：履修登録案内";
  titleSp: string = "履修登録案内";
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

  get image(): string {
    try {
      return require(`~/assets/image/lizardsimg4.jpg`);
    } catch {
      return "";
    }
  }
}
</script>
