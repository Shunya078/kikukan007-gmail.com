<template>
  <v-layout column justify-center align-center>
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
      <div class="course-list-card">
        <v-card class="mx-auto border-color" flat outlined width="100%">
          <v-toolbar color="#2ca14f" dark>
            <v-toolbar-title class="access-text"
              >各学部へのアクセス　<span class="click-link-text"
                >※学科を選択</span
              ></v-toolbar-title
            >
          </v-toolbar>

          <v-list>
            <v-list-group
              v-for="item in items"
              :key="item.title"
              v-model="item.active"
              no-action
            >
              <template v-slot:activator>
                <v-list-item-content class="list-title-wrapper">
                  <v-list-item-title
                    class="list-title"
                    v-text="item.title"
                  ></v-list-item-title>
                </v-list-item-content>
              </template>

              <v-list-item v-for="(child, index) in item.items" :key="index">
                <v-list-item-content>
                  <v-list-item-title
                    class="list-item"
                    v-text="child"
                    @click="toPageMove(item.title, index)"
                  ></v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list-group>
          </v-list>
        </v-card>
      </div>
    </div>
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

.access-text {
  font-size: 28px;
  font-weight: 700;
  letter-spacing: 0.1em;
  padding-left: 24px;
  @include mq-down() {
    padding-left: 0;
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

.course-list-card {
  margin-top: 24px;
  margin-bottom: 72px;
  @include mq-down() {
    margin: 24px;
    margin-bottom: 72px;
  }
}

.list-title {
  font-size: 28px;
  font-weight: 700;
  letter-spacing: 0.1em;
  padding-left: 24px;
  @include mq-down() {
    padding-left: 0;
    font-size: 20px;
    letter-spacing: 0.02em;
  }
}

.list-title-wrapper {
  padding: 24px 0;
  @include mq-down() {
    padding: 20px 0;
  }
}

.list-item {
  font-size: 24px;
  font-weight: 500;
  letter-spacing: 0.1em;
  padding-left: 24px;
  @include mq-down() {
    padding-left: 0;
    font-size: 16px;
    letter-spacing: 0.02em;
  }
}

.click-link-text {
  font-size: 16px;
  font-weight: 700;
  letter-spacing: 0.02em;
  padding-left: 24px;
  @include mq-down() {
    padding-left: 0;
    font-size: 12px;
    letter-spacing: 0.02em;
  }
}
</style>

<script lang="ts">
import { Vue, Component } from "vue-property-decorator";
import "vue-router";
import firebase from "firebase";

@Component({})
export default class DefaultLayout extends Vue {
  loading: boolean = false;
  visible: boolean = false;

  items: Array<{
    items: string[];
    title: string;
  }> = [
    {
      items: ["理学科"],
      title: "理学部",
    },
    {
      items: [
        "医学科",
        "看護学専攻",
        "放射線技術科学専攻",
        "検査技術科学専攻",
        "理学療法学専攻",
        "作業療法学専攻",
      ],
      title: "医学部",
    },
    {
      items: [
        "化学生命工学科",
        "物理工学科",
        "マテリアル工学科",
        "電気電子情報工学科",
        "機械・航空宇宙工学科",
        "エネルギー理工学科",
        "環境土木・建築学科",
      ],
      title: "工学部",
    },
    {
      items: ["生物環境学科", "資源生物科学学科", "応用生命科学学科"],
      title: "農学部",
    },
    {
      items: ["文学科"],
      title: "文学部",
    },
    {
      items: ["教育学科"],
      title: "教育学部",
    },
    {
      items: ["法学科"],
      title: "法学部",
    },
    {
      items: ["経済学科"],
      title: "経済学部",
    },
    {
      items: ["自然情報学科", "人間・社会情報学科", "コンピュータ科学学科"],
      title: "情報学部",
    },
  ];

  toPageMove(title: string, id: number) {
    if (title == this.items[0].title) {
      this.$router.push("/rigaku");
      return
    }
    else if(title == this.items[1].title){
      this.$router.push(`/igaku/${id + 1}`);
      return
    }
    else if(title == this.items[2].title){
      this.$router.push(`/kougaku/${id + 1}`);
      return
    }
    else if(title == this.items[3].title){
      this.$router.push(`/nougaku/${id + 1}`);
      return
    }
    else if(title == this.items[4].title){
      this.$router.push("/bungaku");
      return;
    } else if (title == this.items[5].title) {
      this.$router.push("/kyoiku");
      return;
    } else if (title == this.items[6].title) {
      this.$router.push("/hougaku");
      return;
    } else if (title == this.items[7].title) {
      this.$router.push("/keizai");
      return
    }
    else if(title == this.items[8].title){
      this.$router.push(`zyoho/${id + 1}`);
      return
    }
    this.$router.push("/error");
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
