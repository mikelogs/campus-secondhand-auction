const webpack = require('webpack')

module.exports = {
    publicPath: './',
    assetsDir: 'static',
    productionSourceMap: false,
    configureWebpack: {
        plugins: [
            new webpack.ProvidePlugin({
                $: "jquery",
                jQuery: "jquery",
                "windows.jQuery": "jquery"
            })
        ]
    },
    devServer: {
        port: 8083, // 保留8082端口
        open: true, // 启动自动打开浏览器（低版本支持）
        overlay: false, // 替换client.overlay，低版本直接写在devServer下
        proxy: {
            '/': {
                target: 'http://localhost:8080', // 后端地址
                changeOrigin: true, // 必开跨域代理
                pathRewrite: { '^/': '' }, // 路径重写
                ws: false // 关闭websocket（仅保留这个兼容项）
            }
        },
        headers: {
            'Access-Control-Allow-Origin': '*'
        }
    }
};