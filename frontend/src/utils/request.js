import axios from 'axios';

/* 1. 新增：读取Cookie的工具函数（放在最顶部，import之后） */
function getCookie(name) {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) return parts.pop().split(';').shift();
}

/* axios功能封装  */
const service = axios.create({
    timeout: 5000,
    // baseURL:  'http://localhost:8080',
    withCredentials:  true
});

// request interceptor(请求拦截器)
service.interceptors.request.use(
    config => {
        /* 2. 新增：读取_xsrf令牌并添加到请求头 */
        const xsrfToken = getCookie('_xsrf'); // 读取Cookie里的_xsrf
        if (xsrfToken) {
            // 把令牌添加到请求头，后端会识别这个头验证CSRF
            config.headers['X-XSRF-TOKEN'] = xsrfToken; 
        }
        return config;
    },
    error => {
        console.log(error);
        return Promise.reject(error); // 补充：把error传递出去，方便前端捕获
    }
);

// response interceptor（接收拦截器）
service.interceptors.response.use(
    response => {
        if (response.status === 200) {
            return response.data;
        } else {
            return Promise.reject(response); // 补充：传递错误响应
        }
    },
    error => {
        console.log('请求错误：', error); // 优化：打印具体错误信息
        return Promise.reject(error); // 补充：把error传递出去
    }
);

export default service;