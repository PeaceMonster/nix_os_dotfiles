import yaml
import io

theme = {}

with io.open('/home/ugilt/.config/qtile/theme.yaml') as theme_file:
    theme = yaml.load(theme_file, yaml.Loader)["palette"]

config.load_autoconfig()

c.downloads.location.directory = "~/Hentet/"
config.bind(',m','spawn ~/.local/share/umpv {url}')
config.bind(',M','hint links spawn ~/.local/share/umpv {hint-url}')

config.bind(',th', 'set tabs.show never')
config.bind(',ts', 'set tabs.show always')
config.bind(',sh', 'set statusbar.show never')
config.bind(',ss', 'set statusbar.show always')


c.colors.statusbar.insert.bg =  theme["base0B"]
c.colors.statusbar.insert.fg =  theme["base01"]
c.colors.statusbar.normal.bg =  theme["base00"]
c.colors.statusbar.normal.fg =  theme["base07"]
c.colors.statusbar.command.bg =  theme["base00"]
c.colors.statusbar.command.fg =  theme["base07"]
c.colors.statusbar.caret.bg =  theme["base0E"]
c.colors.statusbar.caret.fg =  theme["base07"]
c.colors.statusbar.passthrough.bg =  theme["base0D"]
c.colors.statusbar.passthrough.fg =  theme["base07"]
c.colors.statusbar.progress.bg =  theme["base05"]
c.colors.statusbar.url.error.fg =  theme["base08"]
c.colors.statusbar.url.fg =  theme["base07"]
c.colors.statusbar.url.hover.fg =  theme["base0C"]
c.colors.statusbar.url.fg =  theme["base07"]
c.colors.statusbar.url.success.http.fg =  theme["base07"]
c.colors.statusbar.url.success.https.fg =  theme["base09"]
c.colors.statusbar.url.warn.fg =  theme["base09"]
c.colors.completion.fg = [ theme["base07"] ,  theme["base07"] ,  theme["base06"]  ]  
c.colors.completion.even.bg =  theme["base01"]
c.colors.completion.odd.bg =  theme["base02"]
c.colors.completion.item.selected.bg =  theme["base0A"]
c.colors.completion.item.selected.fg =  theme["base00"]
c.colors.completion.item.selected.match.fg =  theme["base08"]
c.colors.completion.match.fg =  theme["base08"]
c.colors.completion.item.selected.border.bottom =  theme["base0A"]
c.colors.completion.item.selected.border.top =  theme["base0A"]
c.colors.completion.scrollbar.bg =  theme["base00"]
c.colors.completion.scrollbar.fg =  theme["base07"]
c.colors.tabs.bar.bg =  theme["base00"]
c.colors.tabs.even.bg =  theme["base01"]
c.colors.tabs.even.fg =  theme["base06"]
c.colors.tabs.odd.bg =  theme["base02"]
c.colors.tabs.odd.fg =  theme["base05"]
c.colors.tabs.selected.even.bg =  theme["base00"]
c.colors.tabs.selected.even.fg =  theme["base07"]
c.colors.tabs.selected.odd.bg =  theme["base00"]
c.colors.tabs.selected.odd.fg =  theme["base07"]
