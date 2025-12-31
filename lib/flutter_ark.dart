import 'package:flutter_animate/flutter_animate.dart' as _animate show Effect;
import 'package:intl/intl.dart' as intl show TextDirection;

export 'package:boxy/boxy.dart';
export 'package:boxy/flex.dart';
export 'package:boxy/inflating_element.dart';
export 'package:boxy/padding.dart';
export 'package:boxy/redirect_pointer.dart';
export 'package:boxy/render_boxy.dart';
export 'package:boxy/scale.dart';
export 'package:boxy/slivers.dart';
export 'package:boxy/utils.dart';
export 'package:flutter_animate/flutter_animate.dart' hide Effect;
export 'package:flutter_svg/flutter_svg.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:lucide_icons_flutter/lucide_icons.dart';
export 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

export 'src/app.dart';

//  Components
export 'src/ui/button/button.dart';
export 'src/ui/card/card.dart';

typedef AnimateEffect<T> = _animate.Effect<T>;
typedef IntlTextDirection = intl.TextDirection;
