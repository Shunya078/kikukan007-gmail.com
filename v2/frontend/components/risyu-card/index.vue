<template>
  <div class="d-flex justify-center text-center">
    <div class="card-wrapper">
      <v-card class="card">
        <div class="name-text" v-text="name" />
          <img
              :src="image"
              class="image-content"
            />
      </v-card>
    </div>
  </div>
</template>

<style lang="scss" scoped>
@import "@/assets/scss/_imports.scss";
.card-wrapper {
  padding: 24px;
  width: 540px;
  @include mq-down() {
    padding: 24px 8px;
    width: 360px;
  }
}
.name-text {
  font-size: 26px;
  font-weight: 700;
  line-height: 40px;
  letter-spacing: 4px;
  white-space: pre-wrap;
  padding-top: 20px;
  @include mq-down() {
    font-size: 18px;
    line-height: 21px;
    letter-spacing: 1.5px;
  }
}

.image-content {
  width: 100%;
  height: auto;
  opacity: 1;
  padding: 12px;
  // @include mq-down() {
  //   display: none;
  // }
}
</style>

<script lang="ts">
import { Vue, Component, Prop } from "vue-property-decorator";
@Component({})
export default class RisyuCard extends Vue {
  @Prop() name!: string;
  @Prop() imageSrc!: string;

  get image(): string {
    try {
      return require(`~/assets/images/${this.imageSrc}`);
    } catch {
      return "";
    }
  }
}
</script>
