<template>
  <HelloWorld msg="Hello World" />
  <el-row>
    <el-col :span="24">
      asdasdasdasdasd
    </el-col>
  </el-row>
</template>

<script lang="ts">
import { defineComponent, computed, ref } from 'vue'
import { ElRow, ElCol } from 'element-plus'
import { random } from 'lodash-es'
import dayjs from 'dayjs'
import soulSoother from '@/assets/typings/home'
import { HelloWorld } from '@kydev/vue3-component'

export default defineComponent({
  components: {
    ElRow,
    ElCol,
    HelloWorld
  },
  setup() {
    // 首页心灵鸡汤
    const word = soulSoother[random(0, soulSoother.length - 1)]
    const soulWord = ref(word)
    const currentTime = ref(dayjs().format('YYYY-MM-DD'))
    return {
      soulWord,
      currentTime,
      userInfo: ''
    }
  }
})
</script>

<style scoped lang="scss">
.grid-content {
  background-color: #fff;
  border-radius: 4px;
  height: 295px;

  .loginTime {
    color: #787f95;
    padding-top: 12px;
  }
}

.userInfo {
  display: flex;
  align-items: center;
  height: 100%;

  .userImg {
    width: 120px;
    min-width: 100px;
    height: 120px;
    border-radius: 50%;
    margin-left: 40px;
    vertical-align: middle;

    img {
      width: 100%;
    }
  }
}

.userRight {
  padding: 0 20px 0 40px;

  .name {
    font-size: 20px;
    font-weight: bold;
  }

  h2 {
    font-size: 22px;
    color: #121c40;
    margin: 0;
    border: 0;
    font-weight: 400;
  }

  .userWord {
    font-size: 14px;
    color: #787f95;
    margin-top: 15px;
    line-height: 1.4;
  }
}
</style>
