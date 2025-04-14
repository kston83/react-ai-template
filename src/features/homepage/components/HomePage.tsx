import { Button } from "@/components/ui/button";
import {
	Card,
	CardContent,
	CardDescription,
	CardFooter,
	CardHeader,
	CardTitle,
} from "@/components/ui/card";
import { cn } from "@/lib/utils";

export function HomePage() {
	return (
		<div className="container mx-auto flex min-h-screen flex-col items-center justify-center p-4">
			<h1 className="mb-8 text-4xl font-bold tracking-tight">
				React AI Template Demo
			</h1>
			<p className="mb-12 max-w-2xl text-center text-lg text-muted-foreground">
				Welcome! This page demonstrates a simple setup using React 19, Vite,
				TypeScript, Tailwind CSS v4, and Shadcn UI components.
			</p>

			<Card className="w-full max-w-md">
				<CardHeader>
					<CardTitle>Explore Shadcn UI</CardTitle>
					<CardDescription>
						This card is an example of a Shadcn UI component.
					</CardDescription>
				</CardHeader>
				<CardContent>
					<p>
						You can easily integrate various components like buttons, forms,
						dialogs, and more. Check the{" "}
						<a
							href="https://ui.shadcn.com/docs"
							target="_blank"
							rel="noopener noreferrer"
							className="font-medium text-primary underline underline-offset-4"
						>
							Shadcn UI documentation
						</a>{" "}
						for details.
					</p>
				</CardContent>
				<CardFooter>
					<Button className="w-full">Example Button</Button>
				</CardFooter>
			</Card>

            <div className="mt-16 text-center text-sm text-muted-foreground">
                <p>Project configured with:</p>
                <ul className="mt-2 list-inside list-disc">
                    <li>React 19</li>
                    <li>Tailwind CSS v4</li>
                    <li>TypeScript</li>
                    <li>Vite</li>
                    <li>Shadcn UI</li>
                    <li>ESLint (Flat Config)</li>
                </ul>
            </div>
		</div>
	);
} 