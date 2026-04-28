use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::Arc;

#[derive(Clone, Default)]
pub struct AppAliveness {
    pub alive: Arc<AtomicBool>,
    pub ready: Arc<AtomicBool>,
}

impl AppAliveness {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn set_alive(&self, val: bool) {
        self.alive.store(val, Ordering::Relaxed);
    }

    pub fn set_ready(&self, val: bool) {
        self.ready.store(val, Ordering::Relaxed);
    }

    pub fn is_alive(&self) -> bool {
        self.alive.load(Ordering::Relaxed)
    }

    pub fn is_ready(&self) -> bool {
        self.ready.load(Ordering::Relaxed)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn new_defaults_to_not_alive_and_not_ready() {
        let a = AppAliveness::new();
        assert!(!a.is_alive());
        assert!(!a.is_ready());
    }

    #[test]
    fn set_alive_and_is_alive_round_trip() {
        let a = AppAliveness::new();
        a.set_alive(true);
        assert!(a.is_alive());
        a.set_alive(false);
        assert!(!a.is_alive());
    }

    #[test]
    fn set_ready_and_is_ready_round_trip() {
        let a = AppAliveness::new();
        a.set_ready(true);
        assert!(a.is_ready());
        a.set_ready(false);
        assert!(!a.is_ready());
    }

    #[test]
    fn alive_and_ready_are_independent() {
        let a = AppAliveness::new();
        a.set_alive(true);
        assert!(a.is_alive());
        assert!(!a.is_ready());

        a.set_ready(true);
        assert!(a.is_alive());
        assert!(a.is_ready());
    }

    #[test]
    fn clone_shares_state() {
        let a = AppAliveness::new();
        let b = a.clone();
        a.set_alive(true);
        assert!(b.is_alive());
        b.set_ready(true);
        assert!(a.is_ready());
    }
}
