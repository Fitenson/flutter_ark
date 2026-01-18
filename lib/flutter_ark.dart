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

//  UI Components
export 'src/ui/button/button.dart';
export 'src/ui/button/icon_button.dart';
export 'src/ui/card/card.dart';
export 'src/ui/input/input.dart';
export 'src/ui/form/form.dart';
export 'src/ui/form/field.dart';
export 'src/ui/form/fields/input.dart';

//  Navigation Components
export 'src/navigation/router.dart';
export 'src/navigation/navigation.state.dart';

//  Reusable Components
export 'src/components/focusable.dart';
export 'src/components/keyboard_toolbar.dart';

//  Color Schemes
export 'src/theme/color_theme/blue.dart';
export 'src/theme/color_theme/color_scheme.dart';
export 'src/theme/color_theme/gray.dart';
export 'src/theme/color_theme/green.dart';
export 'src/theme/color_theme/neutral.dart';
export 'src/theme/color_theme/orange.dart';
export 'src/theme/color_theme/red.dart';
export 'src/theme/color_theme/rose.dart';
export 'src/theme/color_theme/slate.dart';
export 'src/theme/color_theme/stone.dart';
export 'src/theme/color_theme/violet.dart';
export 'src/theme/color_theme/yellow.dart';
export 'src/theme/color_theme/zinc.dart';
export 'src/theme/colors.dart';
export 'src/theme/data.dart';
export 'src/theme/decorator.dart';
export 'src/theme/default_keyboard_toolbar.dart';
export 'src/theme/theme.dart';
export 'src/theme/themes/base.dart';
export 'src/theme/themes/shadows.dart';
export 'src/theme/themes/default_theme_variant.dart';
export 'src/theme/themes/default_theme_no_secondary_border_variant.dart';

//  Utils
export 'src/utils/effects.dart';
export 'src/utils/animate.dart';
export 'src/utils/animation_builder.dart';
export 'src/utils/mouse_area.dart';
export 'src/utils/border.dart';
export 'src/utils/gesture_detector.dart';
export 'src/utils/text_controller.dart';
export 'src/utils/states_controller.dart';
export 'src/utils/separated_iterable.dart';
export 'src/utils/mouse_cursor_provider.dart';
export 'src/utils/position.dart';
export 'src/utils/provider.dart' hide ProviderReadExt, ProviderWatchExt;
export 'src/utils/provider_index.dart';
export 'src/utils/responsive.dart';
export 'src/utils/input_formatters.dart';

export 'src/utils/extensions/text_style.dart';
export 'src/utils/extensions/date_time.dart';
export 'src/utils/extensions/double.dart';
export 'src/utils/extensions/duration.dart';
export 'src/utils/extensions/breakpoints.dart';
export 'src/utils/extensions/tap_details.dart';

typedef AnimateEffect<T> = _animate.Effect<T>;
typedef IntlTextDirection = intl.TextDirection;
