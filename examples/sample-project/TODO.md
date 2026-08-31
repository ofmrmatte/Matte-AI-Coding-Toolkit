# TODO — Taskboard

## Now

- [ ] Add integration coverage for task creation and status changes.
- [ ] Verify empty, loading and validation-error states on the task form.
- [ ] Test the task list at 390 px and 1280 px widths.

## Next

- [ ] Add an index for the filters used most often after checking the first production query plan.
- [ ] Document the backup and restore procedure for the production database.

## Later, only if needed

- [ ] Notifications for overdue tasks.
- [ ] Comments on tasks.
- [ ] Audit history beyond `updated_at`.

## Known issue

Long unbroken text in task descriptions can overflow the card on narrow screens. Fix it before calling the mobile layout complete.
