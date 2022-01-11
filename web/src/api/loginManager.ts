import { LocalTokenStorage, SyncLoginManager } from "./LoginManager";

const client = "admin_app";
const secret = "secret";
const scopes = "offline_access internal_api";

export const tokenStorage = new LocalTokenStorage();
export const loginManager = new SyncLoginManager(tokenStorage, "auth_endpoint", secret, client, scopes);