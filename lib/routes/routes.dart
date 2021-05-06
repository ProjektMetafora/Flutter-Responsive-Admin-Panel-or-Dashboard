/// This is temporary, we will move to Beamer Eventually

int routeToIndex(String route) {
  if (route == '/') return 0;
  if (route == '/transactions') return 1;
  if (route == '/tasks') return 2;

  return 0;
}

String indexToRoute(int index) {
  if (index == 0) return '/';
  if (index == 1) return '/transactions';
  if (index == 2) return '/tasks';

  return '/';
}
