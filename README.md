# Tuscany theme

Neovim theme inspired by a trip to Italy where my favorite part of the trip was the region of Tuscany.

<table width="100%">
    <tr>
        <th>Editor</th>
        <th>Terminal</th>
    </tr>
    <tr>
        <td width="50%">
            <img width="1724" alt="image" src="https://github.com/user-attachments/assets/223939e1-be10-4a86-bf5d-c48b2cf3d709">
        </td>
        <td width="50%">
            <img width="1724" alt="image" src="https://github.com/user-attachments/assets/1c939d44-5648-44ef-b708-3141e4cde005">
        </td>
    </tr>
</table>


There are three theme variants:

- Tuscany Night
- Tuscany Day [TODO]
- Tuscany Auto (switches based on time of day / system setting) [TODO]

Extras (in a similar fashion to [tokyonight](https://github.com/folke/tokyonight.nvim)) are also provided.  These will be added based on tools I use, contributions for new extras will be welcome.

## Status

Alpha quality.  I have just started to enable Tuscany as my day to day theme and will continue making refinements and hope to have a v0.1 release ready in the Fall of 2024. I will consider the theme ready for v0.1 when I have used the Tuscany Auto variant as my daily driver for several weeks and I am happy with the experience.

## Installation

With [Lazy](https://github.com/folke/lazy.nvim)

```lua
{
    'matthewmturner/tuscany',
    opts = {
        variant = 'tuscany-night'
    }
}
```

## Thanks

Big thanks to the great [rose-pine](https://github.com/rose-pine/rose-pine-theme) theme that I used as my initial playground for editing a theme and then used some of their source and colors in the Tuscany theme.  I would not have developed this so fast and wouldn't have had as good of taste for colors without the great work done there.

