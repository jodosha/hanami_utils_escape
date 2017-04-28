#[macro_use]
extern crate helix;

ruby! {
    class HanamiUtilsEscape {
        def html(input: String) -> String {
            let mut result = String::new();

            for c in input.chars() {
                let fallback = c.to_string();

                let s: &str = match c {
                    '&'  => "&amp;",
                    '<'  => "&lt;",
                    '>'  => "&gt;",
                    '"'  => "&quot;",
                    '\'' => "&apos;",
                    '/'  => "&#x2F;",
                    _    => fallback.as_str()
                };

                result.push_str(s);
            }

            return result
        }
    }
}
