import { Login } from "../pages/common";

export function AdminLayout({ children }) {
  const auth = null;

  if (!auth) return <Login />;

  return (
    <div>
      <p>AdminLayout</p>
      {children}
    </div>
  );
}
