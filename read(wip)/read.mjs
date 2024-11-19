import fs from "node:fs";

fs.readFile(`${process.cwd()}/garbage.txt`, "utf8", (err, data) => {
    if (err) {
        console.error(err);
        console.error("couldn't read file");
        process.exit();
    } else {
        console.log(data);
    }
});
