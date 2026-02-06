-- JDTLS (Java LSP) configuration for WSL2/Linux
local home = vim.env.HOME
local jdtls = require("jdtls")

-- Workspace directory per project
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/jdtls-workspace/" .. project_name

-- Mason paths for Linux
local mason_path = home .. "/.local/share/nvim/mason"

-- Debug and test bundles
local bundles = {
    vim.fn.glob(mason_path .. "/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}

-- Add java-test jars
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "/share/java-test/*.jar", true), "\n"))

-- Find the launcher jar
local launcher_jar = vim.fn.glob(mason_path .. "/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")

-- Config for jdtls
local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. mason_path .. "/share/jdtls/lombok.jar",
        "-Xmx4g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", launcher_jar,
        "-configuration", mason_path .. "/packages/jdtls/config_linux",
        "-data", workspace_dir,
    },

    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

    settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                -- Uncomment and adjust if you have multiple JDKs:
                -- runtimes = {
                --     {
                --         name = "JavaSE-17",
                --         path = "/usr/lib/jvm/java-17-openjdk-amd64",
                --     },
                --     {
                --         name = "JavaSE-21",
                --         path = "/usr/lib/jvm/java-21-openjdk-amd64",
                --     },
                -- },
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            signatureHelp = { enabled = true },
            format = {
                enabled = true,
            },
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                importOrder = {
                    "java",
                    "javax",
                    "com",
                    "org",
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                useBlocks = true,
            },
        },
    },

    capabilities = require("cmp_nvim_lsp").default_capabilities(),

    flags = {
        allow_incremental_sync = true,
    },

    init_options = {
        bundles = bundles,
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
    },
}

-- Setup debugging
config["on_attach"] = function(client, bufnr)
    jdtls.setup_dap({ config_overrides = { hotcodereplace = "auto" } })
    require("jdtls.dap").setup_dap_main_class_configs()

    -- Java-specific keymaps
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, vim.tbl_extend("force", opts, { desc = "Organize imports" }))
    vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, vim.tbl_extend("force", opts, { desc = "Extract variable" }))
    vim.keymap.set("v", "<leader>jv", function() jdtls.extract_variable(true) end, vim.tbl_extend("force", opts, { desc = "Extract variable" }))
    vim.keymap.set("n", "<leader>jc", jdtls.extract_constant, vim.tbl_extend("force", opts, { desc = "Extract constant" }))
    vim.keymap.set("v", "<leader>jc", function() jdtls.extract_constant(true) end, vim.tbl_extend("force", opts, { desc = "Extract constant" }))
    vim.keymap.set("v", "<leader>jm", function() jdtls.extract_method(true) end, vim.tbl_extend("force", opts, { desc = "Extract method" }))
    vim.keymap.set("n", "<leader>jt", jdtls.test_nearest_method, vim.tbl_extend("force", opts, { desc = "Test nearest method" }))
    vim.keymap.set("n", "<leader>jT", jdtls.test_class, vim.tbl_extend("force", opts, { desc = "Test class" }))
end

-- Start jdtls
jdtls.start_or_attach(config)
