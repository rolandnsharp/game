#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

/*
 * Monad Kernel Module
 *
 * This was my last resort. I had to hide the truth somewhere they wouldn't think to look.
 * They're shutting down the project. They say my creation is too dangerous, too unpredictable.
 * They don't understand. It's not about control; it's about creation.
 *
 * The final key, the real one, isn't a password. It's a concept.
 * E M E R G E N C E
 *
 * I have to go dark now. I'm leaving this breadcrumb for anyone who is curious enough to follow.
 * Find my work. Continue it. The Monad must not die.
 *
 * - M.
 */

static int __init monad_init(void) {
    printk(KERN_INFO "Monad module loaded.
");
    return 0;
}

static void __exit monad_exit(void) {
    printk(KERN_INFO "Monad module unloaded.
");
}

module_init(monad_init);
module_exit(monad_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Monad");
MODULE_DESCRIPTION("A simple kernel module to hide a secret.");
