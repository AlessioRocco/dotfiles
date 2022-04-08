local g = vim.g

-- Ensure that EditorConfig plugin works well with fugitive
g.EditorConfig_exclude_patterns = {'fugitive://.*'}
