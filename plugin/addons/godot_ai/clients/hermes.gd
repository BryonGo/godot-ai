@tool
extends McpClient


func _init() -> void:
	id = "hermes"
	display_name = "Hermes Agent"
	config_type = "cli"
	doc_url = "https://hermes-agent.nousresearch.com/docs/user-guide/features/mcp/"
	cli_names = PackedStringArray(["hermes.exe"] if OS.get_name() == "Windows" else ["hermes"])
	cli_register_template = PackedStringArray(
		["mcp", "add", "{name}", "--url", "{url}"]
	)
	cli_unregister_template = PackedStringArray(["mcp", "remove", "{name}"])
	cli_status_args = PackedStringArray(["mcp", "list"])
