type MaybeAnonymousUser = {
  is_anonymous?: boolean;
};

export function isAnonymousUser(user: MaybeAnonymousUser): boolean {
  return user.is_anonymous === true;
}

export function shouldSkipAnonymousAuth(pathname: string): boolean {
  return (
    pathname === "/login" ||
    pathname.startsWith("/signup") ||
    pathname.startsWith("/upgrade-account") ||
    pathname.startsWith("/auth")
  );
}
