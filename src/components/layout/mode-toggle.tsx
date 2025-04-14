import { Moon, Sun } from "lucide-react";

import { Button } from "@/components/ui/button";
import { Switch } from "@/components/ui/switch";
import { useTheme } from "@/components/providers/theme-provider";

export function ModeToggle() {
	const { theme, setTheme } = useTheme();

	const isDark = theme === "dark";

	const toggleTheme = () => {
		setTheme(isDark ? "light" : "dark");
	};

	return (
		<div className="flex items-center space-x-2">
			<Sun className="size-5 text-muted-foreground" />
			<Switch
				id="dark-mode-toggle"
				checked={isDark}
				onCheckedChange={toggleTheme}
				aria-label={isDark ? "Switch to light mode" : "Switch to dark mode"}
			/>
			<Moon className="size-5 text-muted-foreground" />
		</div>
	);
} 