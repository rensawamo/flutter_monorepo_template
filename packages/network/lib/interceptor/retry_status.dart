import 'dart:io';

const defaultRetryableStatuses = <int>{
  HttpStatus.requestTimeout, // 408
  HttpStatus.tooManyRequests, // 429
  HttpStatus.internalServerError, // 500
  HttpStatus.badGateway, // 502
  HttpStatus.serviceUnavailable, // 503
  HttpStatus.gatewayTimeout, // 504

  440, // Login Timeout (IIS-specific)
  499, // Client Closed Request (Nginx-specific)
  460, // Client Closed Request (AWS-specific)
  598, // Network Read Timeout Error (non-standard)
  599, // Network Connect Timeout Error (non-standard)
  520, // Web Server Returned Unknown Error (Cloudflare)
  521, // Web Server Is Down (Cloudflare)
  522, // Connection Timed Out (Cloudflare)
  523, // Origin Is Unreachable (Cloudflare)
  524, // Timeout Occurred (Cloudflare)
  525, // SSL Handshake Failed (Cloudflare)
  527, // Railgun Error (Cloudflare)
};

@Deprecated('Use [defaultRetryableStatuses]')
const Set<int> retryableStatuses = defaultRetryableStatuses;

bool isRetryable(int statusCode) =>
    defaultRetryableStatuses.contains(statusCode);
