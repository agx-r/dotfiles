const uint8 KEY_PAREN_OPEN = 40; // (
const uint8 KEY_BRACE_OPEN = 123; // {
void main() {
	string param = getenv("kak_hook_param");
	if (param.length() == 0) return;
	uint8 c = param[0]; 
	switch (c) {
	case KEY_PAREN_OPEN:
		print("execute-keys ')<esc>hu'");
		break;
	case KEY_BRACE_OPEN:
		print("execute-keys -draft 'y}'");
		print("execute-keys '<ret>'");
		break;
	}
}
