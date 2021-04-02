<template>
  <div>
    <div class="fullview">
      <div class="loading-spacer"></div>
      <vue-loading
        type="spiningDubbles"
        color="#55ba66"
        :size="{ width: '100px', height: '100px' }"
      >
      </vue-loading>
    </div>
  </div>
</template>

<script>
import { VueLoading } from "vue-loading-template";
export default {
  name: "LoadingView",
  components: {
    VueLoading,
  },
};
</script>

<style>
.fullview {
  width: 100%;
  height: 100%;
  background: #fefefe;
  position: fixed;
  top: 0;
  left: 0;
}
.loading-spacer {
  height: 30%;
}
</style>
