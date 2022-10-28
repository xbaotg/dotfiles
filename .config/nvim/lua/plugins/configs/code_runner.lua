require('code_runner').setup({
  -- put here the commands by filetype
  mode = 'toggle',
  filetype = {
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    cpp = "cd $dir ; g++ $fileName ; ./a.out ; rm a.out",
    python = "python3 $fileName",
    typescript = "deno run",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
  },
})
