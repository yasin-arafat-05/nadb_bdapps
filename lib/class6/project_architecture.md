
## Flutter Clean Architecutre
- Presentation: (Screen, Widget)
- Data: (Data Model)--->(Local Data,Remote Data(Api call))
- Domain: Api Call.

# theme folder:
- Baire thakbe:

# Go Router in Flutter:
- GoRoter -> ShellRoute -> Redirct -> Deep Links -> Named Routes

**What we will learn:** Why GoRouter -> Basic Setup -> go/push/pop -> ShellRoute -> Auth Guards -> Deep Links -> Named Routes.

- Why GoRouter: Flutter default router is complex. That's why we use GoRouter.
- ShellRoute: We can eassily manage bottom navigation bar. 
- Named Routes: Web related pages.
- Go router works good with provider.

**How pages of flutter stores:** Stack based (LIFO). (Splash Page,HomePage,Others) flutter flow this. 


**Go Router follow Stack:** 
i) go() -> replace the entire navigation stack.
ii) push() -> Pushes on top of stack.
iii) replace() -> replace top of stack.
iv) pop() -> pop from top of stack.

**Here we have also dynamic Routes:**


