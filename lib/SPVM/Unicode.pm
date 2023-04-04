package SPVM::Unicode;

our $VERSION = '0.04';

1;

=encoding utf8

=head1 Name

SPVM::Unicode - Unicode Utilities.

=head1 Description

The Unicode class of L<SPVM> has methods for Unicode utilities.

=head1 Usage

  use Unicode;
  
  my $string = "あいうえお";
  my $pos = 0;
  while ((my $uchar = Unicode->uchar($string, \$pos)) >= 0);
    # ...
  }

=head1 Class Methods

=head2 ERROR_INVALID_UTF8

  static method INVALID_UTF8 : int ();

Returns -2.

=head2 is_unicode_scalar_value

  static method is_unicode_scalar_value : int ($code_point: int);

If the code point $code_point is a Unicode scalar value, returns 1. Otherwise returns 0.

=head2 uchar

  static method uchar : int ($string : string, $offset_ref : int*);

Gets a Unicode codepoint by parsing UTF-8 string $string with the offset $$offset_ref  and proceed the offset to the next parsing posision.

If $$offset_ref is over the string length, returns -1.

If an invalid UTF-8 character is found, returns the value of L</"ERROR_INVALID_UTF8">.

=head2 uchar_to_utf8

  static method uchar_to_utf8 : string ($unicode_code_point : int);

Converts the Unicode codepoint $unicode_code_point to a UTF-8 character.

If the $unicode_code_point is invalid Unicode code point, returns undef.

=head2 utf8_to_utf16

  static method utf8_to_utf16 : short[] ($utf8_string : string);

Converts the UTF-8 string $utf8_string to a UTF-16 string, and returns it.

=head2 utf16_to_utf8

  static method utf16_to_utf8 : string ($utf16_string : short[]);

Converts the UTF-16 string $utf16_string to a UTF-8 string, and returns it.

=head2 utf32_to_utf16

  static method utf32_to_utf16 : short[] ($utf32_string : int[]);

Converts the UTF-32 string $utf32_string to a UTF-16 string, and returns it.

=head2 utf16_to_utf32

  static method utf16_to_utf32 : int[] ($utf16_string : short[]);

Converts the UTF-16 string $utf16_string to a UTF-32 string, and returns it.

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License
