# Prompt — revisão UI/UX

```text
Review this UI as a real rendered product, not only as source code.

Read the project instructions and identify the intended users, critical flows and supported viewports.

Inspect the implementation and, when tooling permits, open the real application and test representative screens.

Evaluate:
- visual hierarchy and consistency;
- responsive behavior;
- unexpected overflow/scroll;
- safe areas and mobile browser chrome;
- loading, empty, error and disabled states;
- long content and edge cases;
- forms, validation and action feedback;
- keyboard/focus behavior;
- basic accessibility semantics;
- consistency with the project's design system/brand.

Separate findings into:
P1 blocking usability/regression,
P2 important quality issue,
P3 polish.

For each finding provide location, scenario and expected behavior.

If asked to fix the UI, implement the approved fixes, render again, compare against the criteria, and run the project's functional/build gates.
```
