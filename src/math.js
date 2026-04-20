function sum(a, b) {
    return a + b;
}

if (require.main === module) {
    const args = process.argv.slice(2);
    const a = parseInt(args[0]) || 0;
    const b = parseInt(args[1]) || 0;
    const result = sum(a, b);
    
    const fs = require('fs');
    if (!fs.existsSync('output')) fs.mkdirSync('output');
    fs.writeFileSync('output/result.txt', result.toString());
    
    console.log(`Result: ${a} + ${b} = ${result}`);
}

module.exports = sum;
