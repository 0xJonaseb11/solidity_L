const fs = require('fs');
module.exports = (message) => {
    return new Promise((resolve, reject) => {
        fs.appendFile('message.txt', `${message}\n`, (err) => {
            // console.log('数据已追加到文件');
            err ? reject() : resolve();
        });
    })
}
