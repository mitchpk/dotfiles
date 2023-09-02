const { Label } = ags.Widget;
const { execAsync } = ags.Utils;
const { DateTime } = imports.gi.GLib;

export const Clock = ({
    format = '%H:%M %A %d %B',
    interval = 1000,
    ...props
} = {}) => Label({
    className: 'clock',
    ...props,
    connections: [[interval, label =>
        label.label = DateTime.new_now_local().format(format),
    ]],
});

export const Uptime = ({
    interval = 60000,
    ...props
} = {}) => Label({
    ...props,
    connections: [[interval, label => {
        execAsync("uptime -p")
            .then(time => label.label = time)
            .catch(print);
    }]],
});
