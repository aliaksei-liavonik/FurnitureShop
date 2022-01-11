
import mkCqrsClient from "./CqrsClients/AxiosCqrsClient/mkCqrsClient";
import { loginManager } from "./loginManager";
import Client from "./FurnitureShopClient";
import { TokenProvider } from "./CqrsClients/CqrsClientBase";

export const bearerTokenProvider: TokenProvider = {
    getToken: () => loginManager.getToken().then((t: any) => (t ? t : undefined)),
    invalidateToken: () => loginManager.tryRefreshToken().then(Boolean),
};

const cqrsClient = mkCqrsClient('https://api.local.lncd.pl/api', bearerTokenProvider);

export type CQRS = typeof cqrsClient;

const api = Client(cqrsClient);

export default api;