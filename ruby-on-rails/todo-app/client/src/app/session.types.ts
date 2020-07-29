export interface LoginParams {
  email: string;
  password: string;
}

export interface LoginResponse {
  status: string;
  token: string;
  error?: string;
}

export interface LogoutResponse {
  status: string;
}
