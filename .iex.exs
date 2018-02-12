IEx.configure([
  colors: [enabled: true],
  history_size: -1,
   default_prompt: [
     "\e[G\e[1;36m reckons\e[0m \e[1;37m🤔  >\e[0m"
   ] |> IO.chardata_to_string,
  inspect: [
    limit: :infinity,
    pretty: true,
    syntax_colors: [
      number: :magenta,
      atom: :cyan,
      string: :green,
      boolean: :magenta,
      nil: :magenta
    ],
  ],
])

# You can put aliases in here to save typing when you boot an iex shell.
