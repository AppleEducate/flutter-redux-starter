class Token {
  String access_token;
  String token_type;
  String expires_in;

  Token({
    this.access_token,
    this.token_type,
    this.expires_in,
  });

  static Token fromJson(Map<String, dynamic> json) {
    return Token(
      access_token: json['access_token'],
      token_type: json['token_type'],
      expires_in: json['expires_in'],
    );
  }

  Map<String, dynamic> toJson() => {
        'access_token': access_token,
        'token_type': token_type,
        'expires_in': expires_in,
      };
}
