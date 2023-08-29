import { Clock, Uptime } from '../../modules/clock.js';
const { Box, Label } = ags.Widget;

export const PopupContent = props => Box({
    ...props,
    vertical: true,
    className: 'datemenu',
    children: [
        Clock({ format: '%H:%M:%S' }),
        Box({
            className: 'uptime-box',
            halign: 'center',
            children: [
                Uptime(),
            ],
        }),
        Box({
            className: 'calendar',
            children: [
                ags.Widget({
                    type: imports.gi.Gtk.Calendar,
                }),
            ],
        }),
    ],
});
