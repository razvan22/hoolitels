module.exports = {
  devServer: {
    proxy: {
      "^/rest": {
        target: "http://localhost:8070",
        ws: true,
        changeOrigin: true,
      },
      "^/login": {
        target: "http://localhost:8070",
        ws: true,
        changeOrigin: true,
      },
      "^/logout": {
        target: "http://localhost:8070",
        ws: true,
        changeOrigin: true,
      },
      "^/api": {
        target: "http://localhost:8070",
        ws: true,
        changeOrigin: true,
      },
    },
  },
};
