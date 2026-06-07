@tool
extends McpClient


func _init() -> void:
	id = "codewhale"
	display_name = "CodeWhale"
	config_type = "cli"
	doc_url = "https://docs.deepseek.com/"
	cli_names = PackedStringArray(["codewhale", "codewhale.exe"] if OS.get_name() == "Windows" else ["codewhale"])
	cli_register_template = PackedStringArray(["mcp", "add", "{name}", "--url", "{url}"])
	cli_unregister_template = PackedStringArray(["mcp", "remove", "{name}"])
	cli_status_args = PackedStringArray(["mcp", "list"])
	## JSON fallback for when `codewhale` CLI isn't on PATH — e.g.
	## CodeWhale installed via an IDE extension that doesn't expose a binary.
	## `codewhale mcp add --url <url>` writes into ~/.codewhale/mcp.json:
	##   "godot-ai": { ..., "url": "<url>", ... }
	path_template = {"unix": "~/.codewhale/mcp.json", "windows": "$USERPROFILE/.codewhale/mcp.json"}
	server_key_path = PackedStringArray(["servers"])
	entry_url_field = "url"
