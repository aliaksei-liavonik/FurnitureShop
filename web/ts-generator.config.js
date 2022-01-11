/* eslint-env node */

const { resolve } = require("path");

const config = {
    typesFile: {
        filename: "FurnitureShopTypes.ts",
    },
    clientFile: [
        {
            eslintExclusions: ["import/no-anonymous-default-export", "prettier/prettier"],
            filename: "FurnitureShopClient.ts",
            include: ["FurnitureShop"],
            cqrsClient: {
                location: "./index.ts",
                exportName: "CQRS",
            },
        },
    ],
    baseNamespace: "FurnitureShop.Core.Contracts",
    nameTransform: nameWithNamespace => {
        const parts = nameWithNamespace.split(".");

        let name = parts[parts.length - 1];
        const nameParts = [];

        nameParts.push(name);

        return nameParts.join(".");
    },
    baseDir: resolve(__dirname, "src/api"),
    input: {
        base: resolve(__dirname, "../backend/src"),
        project: ["Core/FurnitureShop.Core.Contracts/FurnitureShop.Core.Contracts.csproj"],
        include: [
            "Core/FurnitureShop.Core.Contracts/Web/**/*.cs",
            "Core/FurnitureShop.Core.Contracts/Shared/**/*.cs",
            "Core/FurnitureShop.Core.Contracts/Auth.cs",
        ],
    },

};

module.exports = config;
